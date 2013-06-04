package.path=package.path .. ';./lua/?.lua'

local senef = require "senefelder" 


local index=senef.get_contents('index.md')
local html=markdown(index)


local temp=[[
<html>${text}<hr>${foot}</html>
]]

senef.put_contents('index.html', senef.fill_template(temp, {text=html, foot="(c) Severák 2013"}))