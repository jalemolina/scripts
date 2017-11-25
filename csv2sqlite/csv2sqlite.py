#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# www.pythondiario.com
""" Carga una db sqlite a partir de una archivo csv.
Se espera que exista el archivo 'archivo.csv'.
Se creará un archivo archivo.db si este no existe"""

import sqlite3
import csv
import errno


DB_NAME = 'artists'
PATH_FILE = 'albums.csv'
TABLE_NAME = PATH_FILE.split('.')[0]

# Abrimos el archivo CSV
try:
    with open(PATH_FILE, 'r') as FILE:
        # Obtengo el encabezado
        HEADER = next(FILE, None).split(',')

        TYPES = []

        print('Indique los tipos [TEXT|INT|REAL]')
        for column in HEADER:
            tmp = input(column + ': ')
            TYPES.append(tmp)

        TABLE_TYPE = '('
        INSERT = 'INSERT INTO ' + TABLE_NAME + ' VALUES ('

        def poner_hasta_fin(iterador, fin, relleno, final):
            """TODO: Docstring for poner_hasta_fin.

            :iterador: TODO
            :fin: TODO
            :relleno: TODO
            :final: TODO
            :returns: TODO

            """
            return relleno if iterador != fin else final


        for i in range(len(HEADER)):
            TABLE_TYPE += HEADER[i] + ' ' + TYPES[i] + \
                            poner_hasta_fin(i, len(HEADER) - 1, ', ', ')')
            INSERT += '?' + poner_hasta_fin(i, len(HEADER) - 1, ', ', ')')

        READER = csv.reader(FILE, delimiter=',')

        # Crea la BD en la carpeta donde se encuentra el script
        SQL = sqlite3.connect(DB_NAME + '.db')
        CUR = SQL.cursor()

        # Creamos la tabla si no existe
        CUR.execute(' '.join(['CREATE TABLE IF NOT EXISTS',
                              TABLE_NAME,
                              TABLE_TYPE]))

        # Llenamos la BD con los datos del CSV
        for row in READER:
            CUR.execute(INSERT, tuple(row))

        # Muestro las filas guardadas en la tabla
        for row in CUR.execute('SELECT * FROM ' + TABLE_NAME):
            print(row)

    # Cerramos el archivo y la conexion a la bd
    SQL.commit()
    SQL.close()

except OSError as ex:
    if ex.errno == errno.ENOENT:
        # do your FileNotFoundError code here
        print("No existe el archivo")
    else:
        raise ex
