local File = {}

function File:isDir(path)
  local file = io.open(path, 'r')

  if (file == nil) then return false end

  local ok, err, code = file:read(1)
  file:close()

  return code == 21
end

function File:exists(path)
  local file = io.open(path, 'r')

  if file ~= nil then
    io.close(file)
    return true
  else
    return false
  end
end

function File:pathJoin(path, file)
  return table.concat({ path, file }, '/')
end

function File:getIndex(path)
  filename = self:pathJoin(path, 'index.html')

  if not self:exists(filename) then
    filename = self:pathJoin(path, 'index.htm')
    if not filename then return nil end
  end

  return filename
end

function File:open(path)
  local filename = path

  if self:isDir(path) then
    filename = self:getIndex(path)
  end

  local file = io.open(filename, 'r')

  if file then
    return file:read('*all')
  end

  return nil
end

return File
