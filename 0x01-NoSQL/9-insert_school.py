#!/usr/bin/env python3
'''
Defines a function that inserts a new document in a collection based on kwargs
'''
from pymongo import MongoClient
from typing import Mapping


def insert_school(mongo_collection: MongoClient,
                  **kwargs: Mapping[str, str]) -> str:
    ''' inserts a new document in a collection based on kwargs'''
    return mongo_collection.insert_one(kwargs).inserted_id

