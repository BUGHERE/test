'''
病人信息
'''
import datetime

from sqlalchemy import Integer, BigInteger, String, DateTime, Text, Boolean, Column, Sequence, ForeignKey, UniqueConstraint
from sqlalchemy.orm import backref, relationship

from rptserver.database.sqlal import Base

class Patient(Base):
    '''病人'''
    __tablename__ = '病人信息'
    id = Column(BigInteger,  primary_key=True, name = '病案号')
    name = Column(String(255), doc='姓名',name = '姓名')
    phone = Column(BigInteger,doc="电话", name = '电话')
    age = Column(Integer, doc="发病是年龄", name = '发病时年龄')
    fbDate = Column(DateTime, doc="发现日期", name = '发现日期')
    ryDate = Column(DateTime, doc="入院日期", name = '入院日期')
    site = Column(String(32), doc='`右乳or左乳or双乳`', name = '右乳or左乳or双乳')