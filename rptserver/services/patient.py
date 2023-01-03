import logging

from flask import g

from rptserver.database.sqlal import func_to_char
from rptserver.model.patient import Patient

class PatientService(object):
    
    def query(self,pageNum=None, pageSize=10, **query_conds):
        
        query = g.db_session.query(Patient)
        
        for key, value in query_conds.items():
            model_column = getattr(Patient, key, None)
            if model_column and bool(value):
                if "CHAR" in str(model_column.type) or "TEXT" in str(model_column.type):
                    query = query.filter(getattr(Patient, key).contains(value))
                elif "DATE" in str(model_column.type):
                    query = query.filter(func_to_char(getattr(Patient, key), "yyyy-mm-dd") == value)
                else:
                    query = query.filter(getattr(EnemyArea, key) == value)
            else:
                logging.warning("Unknow Query Condtions [%s] For %s", key, Patient)
        total = query.count()

        if bool(pageNum) or bool(pageSize):
            query = query.limit(pageSize).offset(pageSize * (int(pageNum) - 1))
        
        rst = []
        for pat in query.all():
            rst.append(pat)
        return {"data": rst, "total" : total}

    
    def getDetail(self, id):
        query = g.db_session.query(Patient).filter(Patient.id == id)
        rst = {}
        if(query.count() > 0):
            rst = query.first()
        
        return rst
    
    def search(self, key, pageSize=10, pageNum=1):
        query = g.db_session.query(Patient).filter(Patient.name.like("%{}%".format(key)))
        
        total = query.count()
        if bool(pageNum) or bool(pageSize):
            query = query.limit(pageSize).offset(pageSize * (int(pageNum) - 1))
        
        rst = []
        for pat in query.all():
            rst.append(pat)
        return {"data": rst, "total" : total}
        