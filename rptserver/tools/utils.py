# -*- coding=utf-8 -*-
import hashlib

def to_md5(pwd):
    encryption = hashlib.md5()
    if pwd:
        encryption.update(pwd.encode('utf-8'))
        return encryption.hexdigest()
    return False
