# -*- coding:utf-8 -*-
import logging
from faker import Faker
import random

from ..model.patient import Patient

fake = Faker(locale=['zh_CN'])

def init_patient(session):
    """ 初始化病人信息
    :param session:
    """

    patientList = []
    for i in range(100):
        patient = Patient(**{
            "id": i,
            "name": fake.name(),
            # "phone" : int(fake.phone_number()),
            "phone": random.randint(10 ** 8, 10 ** 9),
            "age": random.randint(8, 80),
            "fbDate": fake.date(pattern="%Y-%m-%d", end_datetime=None),
            "ryDate": fake.date(pattern="%Y-%m-%d", end_datetime=None),
            "cyDate": fake.date(pattern="%Y-%m-%d", end_datetime=None),
            # "site" : random.choice(["右乳", "左乳", "双乳"])
            "death": random.choice(["是", "否"]),
            "deathtime": fake.date(pattern="%Y-%m-%d", end_datetime=None)
        })

        patientList.append(patient)

    session.add_all(patientList)
    session.commit()