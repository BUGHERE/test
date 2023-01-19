from flask_restplus import Namespace, Resource, fields, reqparse

from rptserver.services.user import UserService
from rptserver.services.patient import PatientService

_NS = Namespace('api', description='功能')
_Service = UserService()

_PatientService = PatientService()
@_NS.route('/login')
class Branches(Resource):
    """用户登录"""

    get_parser = reqparse.RequestParser()
    get_parser.add_argument('admin', help="admin", type=str, required=True)
    get_parser.add_argument('password', help="password", type=str, required=True)
    get_model = _NS.model("BranchesModel", {
        'admin': fields.String(required=False, description='用户代码'),
        'name': fields.String(required=False, description='用户名称'),
        'status': fields.String(required=False, description='用户状态'),
        'token': fields.String(required=False, description='access_token'),
        'expire': fields.String(required=False, description='token失效时间'),
    })

    @_NS.expect(get_parser)
    @_NS.marshal_with(get_model, as_list=True)
    def get(self):
        args = self.get_parser.parse_args()
        
        return _Service.login(**args)

@_NS.route('/info/add')

class UserInfo(Resource):
    # 添加用户
    post_parser = reqparse.RequestParser()
    post_parser.add_argument('name', help="用户姓名", type=str, required=False, default=None)
    post_parser.add_argument('admin', help="用户名", type=str, required=False, default=None)
    post_parser.add_argument('password', help="密码", type=str, required=False, default=None)
    post_parser.add_argument('status', help="状态:正常，停用，休假", type=str, required=False, default=None)
    post_model = _NS.model('UsersPostModel', {
        "id" : fields.Integer(required=True, description='用户ID'),
        'status': fields.Integer(required=True, description='状态'),
    })

    @_NS.expect(post_parser)
    @_NS.marshal_with(post_model)
    def post(self):
        ' 新增系统用户 '
        args = self.post_parser.parse_args()
        data = _Service.add_user(**args)
        return data


@_NS.route('/info/update') 
class UserUpdate(Resource):
     # 维护用户
    put_parser = reqparse.RequestParser()
    put_parser.add_argument('id', help="用户编号", type=int, required=False, default=None)
    put_parser.add_argument('name', help="用户姓名", type=str, required=False, default=None)
    put_parser.add_argument('admin', help="用户名", type=str, required=False, default=None)
    put_parser.add_argument('password', help="密码", type=str, required=False, default=None)
    put_parser.add_argument('status', help="状态:正常，停用，休假", type=str, required=False, default=None)
    put_model = _NS.model('UsersPutModel', {
        "id" : fields.Integer(required=True, description='用户ID'),
        'status': fields.Integer(required=True, description='状态'),
        'message': fields.String(required=True, description='信息'),
    })

    @_NS.expect(put_parser)
    @_NS.marshal_with(put_model)
    def put(self):
        ' 维护用户 '
        args = self.put_parser.parse_args()
        data = _Service.update_user(**args)
        return data

@_NS.route('/info/get')
class PatientInfo(Resource):
    """patient"""
    
    get_parser = reqparse.RequestParser()
    get_parser.add_argument('pageNum', help="分页参数-数据页数, 默认第一页", type=int, required=False, default=None)
    get_parser.add_argument('pageSize', help="分页参数-单页条数, 默认10行每页", type=int, required=False, default=None)
    get_model = _NS.model('PatientGetModel', {
        'message': fields.String(required=True, description='查看消息'),
        'total': fields.Integer(required=True, description='数据条数'),
        'data': fields.List(
            fields.Nested(
                _NS.model('PatientListGetDataModel', {
                    'id': fields.Integer(required=False, description='病案号'),
                    'name': fields.String(required=False, description='姓名'),
                    'phone': fields.Integer(required=False, description='电话'),
                    'age': fields.Integer(required=False, description='发病时年龄'),
                    'fbDate': fields.DateTime(required=False, description='发现日期'),
                    'ryDate': fields.DateTime(required=False, description='入院日期'),
                    'cyDate': fields.DateTime(required=False, description='出院日期'),
                    'death': fields.String(required=False, description='死亡与否'),
                    'deathtime': fields.DateTime(required=False, description='死亡时间')
                }, required=True, description='数据内容')
            ))
    })

    @_NS.expect(get_parser)
    @_NS.marshal_with(get_model, as_list=True)
    def get(self):
        args = self.get_parser.parse_args()
        return _PatientService.query(**args)

@_NS.route('/info/detail')
class Detail(Resource):
    
    get_parser = reqparse.RequestParser()
    get_parser.add_argument('id', help="病案号", type=str, required=True)
    get_model = _NS.model("DetailModel", {
        'id': fields.Integer(required=False, description='病案号'),
        'name': fields.String(required=False, description='姓名'),
        'phone': fields.Integer(required=False, description='电话'),
        'age': fields.Integer(required=False, description='发病时年龄'),
        'fbDate': fields.DateTime(required=False, description='发现日期'),
        'ryDate': fields.DateTime(required=False, description='入院日期'),
        'death': fields.String(required=False, description='死亡与否'),
        'deathtime': fields.DateTime(required=False, description='死亡时间')
    })

    @_NS.expect(get_parser)
    @_NS.marshal_with(get_model, as_list=True)
    def get(self):
        args = self.get_parser.parse_args()
        
        return _PatientService.getDetail(**args)

@_NS.route('/info/search')
class Search(Resource):
    get_parser = reqparse.RequestParser()
    get_parser.add_argument('pageNum', help="分页参数-数据页数, 默认第一页", type=int, required=False, default=None)
    get_parser.add_argument('pageSize', help="分页参数-单页条数, 默认10行每页", type=int, required=False, default=None)
    get_parser.add_argument('key', help="关键词", type=str, required=True)
    get_model = _NS.model('PatientGetModel', {
        'message': fields.String(required=True, description='查看消息'),
        'total': fields.Integer(required=True, description='数据条数'),
        'data': fields.List(
            fields.Nested(
                _NS.model('PatientListGetDataModel', {
                    'id': fields.Integer(required=False, description='病案号'),
                    'name': fields.String(required=False, description='姓名'),
                    'phone': fields.Integer(required=False, description='电话'),
                    'age': fields.Integer(required=False, description='发病时年龄'),
                    'fbDate': fields.DateTime(required=False, description='发现日期'),
                    'ryDate': fields.DateTime(required=False, description='入院日期'),
                    'death': fields.String(required=False, description='死亡与否'),
                    'deathtime': fields.DateTime(required=False, description='死亡时间')
                }, required=True, description='数据内容')
            ))
    })
    
    @_NS.expect(get_parser)
    @_NS.marshal_with(get_model, as_list=True)
    def get(self):
        args = self.get_parser.parse_args()
        
        return _PatientService.search(**args)