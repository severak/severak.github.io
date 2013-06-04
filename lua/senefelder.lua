---
-- Senefelder
---
-- Severak's static page generator
---

-- 5.2 compatibility for markdown
local CE=require 'compat_env'
_G.setfenv=CE.setfenv
_G.getfenv=CE.getfenv
if table.unpack then
	_G.unpack=table.unpack
end


require 'markdown'

local S={}

function S.get_contents(filename)
	local fh, err=io.open(filename,'r')
	if not fh then
		return nil, err
	end
	local data=fh:read('*all')
	fh:close()
	return data
end

function S.put_contents(filename, data)
	local fh, err=io.open(filename,'w+')
	if not fh then
		return nil, err
	end
	fh:write(data)
	fh:close()
end

function S.fill_template(template,variables)
	local ret=string.gsub(template, "%$%{(%w+)%}", variables)
	local ret=string.gsub(ret, "%$%{%w+%}", "")
	return ret
end

function S.fake_pipe(command)
	local tmpfile=os.tmpname()
	os.execute(command .. '>' ..tmpfile)
	
end

return S