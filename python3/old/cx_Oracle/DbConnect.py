import os
import collections
from sqlalchemy import create_engine, MetaData, Table, select, insert
from sqlalchemy.pool import NullPool



'''
db별로 객체 생성하도록 함.
'''

class DbConnect:
        
    def __init__(self, urls):
        
        self.urls = urls
        self.meta = MetaData()
        
        # sqlalchemy_addr Database Urls 예시
        # engine = create_engine('oracle://scott:tiger@127.0.0.1:1521/sidname')
        # echo=False 로그출력 안함.
        # poolclass=NullPool 커넥션풀 사용안함
        self.engine = create_engine(urls, echo=False, poolclass=NullPool)

        
    def getConnection(self):
        return self.engine.raw_connection()
    
    def getTable(self, schema, tableName):
        return Table(tableName, self.meta, schema=schema, autoload=True, autoload_with=self.engine)
