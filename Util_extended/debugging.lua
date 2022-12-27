function print(...)
  file = io.open("test.log", "a+")
  io.output(file)

  for i,v in ipairs(arg) do
    io.write(tostring(v) .. "\t")
  end
  io.write("\n")
  io.close(file)
end

function table_to_string(tbl)
  if type(tbl) ~= "table" then
      return "not a table"
  end
  local s = ""
  for k, v in pairs(tbl) do
      s = s .. k .. " (" .. tostring(v) .. ") \n"
  end
  return s
end

function string.starts(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

function table_to_string_reccurrent(tbl, prefix)
  -- if (tbl._M ~= nil) then -- skip modules
  --     return
  -- end
  
  for k, v in pairs(tbl) do
      if not string.starts(k, "_") then -- skip lua internal stuff
          if type(v) ~= "table" then
              io.write("(" .. type(v) .. ") " .. prefix .. k .. "\n")
              io.flush()
          elseif k ~= nil then
              table_to_string_reccurrent(v, prefix .. k .. ".")
          end
      end
  end
end

function save_table_deep(tbl, filename)
  if type(tbl) ~= "table" then
      return
  end
  
  io.output(filename)
 
  -- for k, v in pairs(tbl) do
  --   io.write("(" .. type(v) .. ") " .. k .. "\n")
  --   io.flush()
  -- end
  
  for k, v in pairs(tbl) do
      if type(v) ~= "table" then
          io.write("(" .. type(v) .. ") " .. k .. "\n")
          io.flush()
      elseif k ~= "_G" and k ~= "package" and k ~= "_LOADED" and k ~= nil then
          table_to_string_reccurrent(v, k .. ".")
      end
  end
end

-- function ioTest1(str)
--   file = io.open("test123.log", "w+")
--   io.output(file)

--   -- for i,v in ipairs(arg) do
--   --   io.write(tostring(v) .. "\t")
--   --   --printResult = printResult .. tostring(v) .. "\t"
--   -- end
--   io.write(str .. "\n")
--   --printResult = printResult .. "\n"
--   io.close(file)
-- end