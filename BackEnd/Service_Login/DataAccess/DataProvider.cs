﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;

public class DataProvider
{
    //==================================================
    //==================================================
    //==================================================
    //  Config

    public static string ConnectionString
    {
        get
        {
            return Configs.CONNECTION_STRING;
        }
    }

    //==================================================
    //==================================================
    //==================================================
    //  Log SQL

    public static dynamic LogConfigs
    {
        get
        {
            return new
            {
                Enable = true,
                FileName = "ServiceLogin_SQLlog.sql",
                QueryTypes = new string[] { "insert", "delete", "update" },
                DatabaseName = "Service_Login",
                SaveFolder = @"C:\Users\19101994\Documents\GitHub\DoAn-PT-HTTT-HD\BackEnd\ServerFileTransfer\ServerFileTransfer\bin\Debug\send\",
            };
        }
    }

    private static void WriteLog(string query)
    {
        if (LogConfigs.Enable)
        {
            //init
            var queryLC = query.ToLower();
            //check query insert/update
            foreach (var t in LogConfigs.QueryTypes)
            {
                if (queryLC.Contains(t))
                {
                    //write log
                    var file = LogConfigs.SaveFolder + LogConfigs.FileName;
                    if (!File.Exists(file))
                    {
                        using (var writer = new StreamWriter(File.Create(file))) { writer.WriteLine(string.Format("use [{0}]", LogConfigs.DatabaseName)); }
                    }
                    using (var writer = File.AppendText(file))
                    {
                        writer.WriteLine(query);
                    }
                    return;
                }
            }
        }
    }

    //==================================================
    //==================================================
    //==================================================
    //  Source

	public static int ExecuteNonQuery(string query)
	{
		var result = -1;
		try
		{
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector);
                result = command.ExecuteNonQuery();
                connector.Close();
                //log
                WriteLog(query);
            }
		}
		catch (Exception ex)
		{
			throw ex;
		}
		return result;
	}

    public static List<T> ExecuteReader<T>(Func<SqlDataReader, T> func, string query)
    {
        var result = new List<T>();
        try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector);
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(func(reader));
                    }
                    reader.Close();
                }
                connector.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

    public static T ExecuteReaderOne<T>(Func<SqlDataReader, T> func, string query)
    {
        T result = default(T);
        try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector);
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result = func(reader);
                        break;
                    }
                    reader.Close();
                }
                connector.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

	public static object ExecuteScalar(string query)
	{
		object result = null;
		try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector);
                result = command.ExecuteScalar();
                connector.Close();
            }
		}
		catch (Exception ex)
		{
			throw ex;
		}
		return result;
	}

	public static int StoredProcedure_ExecuteNonQuery(string query, params SqlParameter[] paramaters)
	{
		var result = -1;
		try
		{
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.AddRange(paramaters);
                result = command.ExecuteNonQuery();
                connector.Close();
            }
		}
		catch (Exception ex)
		{
			throw ex;
		}
		return result;
	}

    public static List<T> StoredProcedure_ExecuteReader<T>(Func<SqlDataReader, T> func, string query, params SqlParameter[] paramaters)
    {
        var result = new List<T>();
        try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.AddRange(paramaters);
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result.Add(func(reader));
                    }
                    reader.Close();
                }
                connector.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

    public static T StoredProcedure_ExecuteReaderOne<T>(Func<SqlDataReader, T> func, string query, params SqlParameter[] paramaters)
    {
        T result = default(T);
        try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.AddRange(paramaters);
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        result = func(reader);
                        break;
                    }
                    reader.Close();
                }
                connector.Close();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

	public static object StoredProcedure_ExecuteScalar(string query, params SqlParameter[] paramaters)
	{
		object result = null;
		try
        {
            using (var connector = new SqlConnection(ConnectionString))
            {
                connector.Open();
                var command = new SqlCommand(query, connector) { CommandType = System.Data.CommandType.StoredProcedure };
                command.Parameters.AddRange(paramaters);
                result = command.ExecuteScalar();
                connector.Close();
            }
		}
		catch (Exception ex)
		{
			throw ex;
		}
		return result;
	}
}
