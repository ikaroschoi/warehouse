package com.ikaros.warehouse.Controller;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectReader;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class CsvReader{
    private static final CsvMapper csvmapper = new CsvMapper();
    public static <T> List<T> read(Class<T> modelClass, InputStream stream) throws IOException {


        CsvSchema schema = csvmapper.schemaFor(modelClass).withHeader().withColumnReordering(true);
        ObjectReader reader = csvmapper.readerFor(modelClass).with(schema);
        return reader.<T>readValues(stream).readAll();
    }
}
