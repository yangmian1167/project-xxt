
--[[
local cloud_cc = require("cloud_cc")(
	"2BA695C9633E1E712764746FFD90649C",
	{
		"/lua/scripts/faker.lua",
		"/lua/scripts/xxtsp.lua",
		"/lua/scripts/nLog.xxt",
	}
)

]]




nLog = require('nLog')()
require('faker')
require('xxtsp')

if not(xxtinstall())then
	log("伪装失效")
	os.exit()
else
	XXTFaker = require("XXTFaker")()
end

function atexit(callback) -- 参数为一个函数，使用 atexit(一个函数) 注册一个函数在脚本结束时执行，建议不要耗时太长
	____atexit_guard____ = ____atexit_guard____ or {}
	if type(____atexit_guard____) == 'table' then
		if not getmetatable(____atexit_guard____) then
			setmetatable(____atexit_guard____, {
					__gc = function(self)
						if type(self.callback) == 'function' then
							pcall(self.callback)
						end
					end
				})
		end
		____atexit_guard____.callback = callback
	else
		error('别用 `____atexit_guard____` 命名你的变量。')
	end
end

atexit(function() 
		sys.toast('脚本结束了！')
		vpnx()
		local appbids = app.front_bid()
		if appbids ~= "com.apple.springboard" then
			app.quit(appbids)
			--closeX(appbids)
		end
		sys.msleep(500)
	end)

bid={}
bid.小米贷款 = { 1236629993,"com.xiaomi.loan"}



screen.init(0)
var = {}
var.lun = 0
var.source = "beeplay_waifang1_07"
var.key = "hkbnrpa2p6u6do11i8cftx4c0z8n78u8"
--全局变量

function up(name,other)
	local url = 'http://hlj.51-gx.com/Public/idfa/?service=idfa.idfa'
	local idfalist ={}
	idfalist.phonename = phonename or device.name()
	idfalist.phoneimei = phoneimei or sys.mgcopyanswer("SerialNumber")
	idfalist.phoneos = phoneos or sys.version()
	idfalist.name = name
	idfalist.idfa = idfa
	idfalist.ip = '192.168.1.1'
	idfalist.ip = get_ip() or '192.168.1.1'
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function checkidfa(appid,idfa)
	
	--local url = "http://111.230.78.86:8080/interface/distinct?appid="..appid.."&idfa="..idfa
	local url = "http://app.ubangok.com/YouBang/SyncServer?type=CheckIDFA&idfa="..idfa.."&adid=176&channel=10208"
	log(url)
	idfa = idfa
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		log("data--"..data[idfa])
		if data[idfa] == 0 or data[idfa] == "0" then
			log("idfa: OK.",true)
			return true
		else
			log("idfa, 排重失败",true)
		end
	end
end
function clickidfa(idfa)
	
	--local url = "http://111.230.78.86:8080/interface/distinct?appid="..appid.."&idfa="..idfa
	ip = get_ip() or "192.168.1.1"
	local url = "http://app.ubangok.com/YouBang/SyncServer?type=ClickSync&idfa="..idfa.."&ip="..ip.."&adid=176&channel=10208"
	log(url)
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data["resultCode"] == 1000 then
			log("clickidfa: OK.",true)
			return true
		else
			log("idfa, 排重失败",true)
		end
	end
end

function activeLink(idfa)
	
	--local url = "http://111.230.78.86:8080/interface/distinct?appid="..appid.."&idfa="..idfa
	ip = get_ip() or "192.168.1.1"
	local url = "http://app.ubangok.com/YouBang/SyncServer?type=Activation&idfa="..idfa.."&ip="..ip.."&adid=176&channel=10208"
	log(url)
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data["resultCode"] == 1000 then
			log("激活成功: OK.",true)
			return true
		else
			log("idfa, 激活失败",true)
		end
	end
end

function checkip()
	local ip = get_ip() or "192.168.1.1"
	local url = 'http://hlj.51-gx.com/Public/idfa/?service=idfa.checkip&ip='..ip
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data.data.state == "ok" then
			log("ip可以用:OK.",true)
			return true
		else
			log("ip, 排重失败",true)
		end
	end
end


function idfaisok(name)
	if XXTfakerNewPhone(bid[name][2])then
		idfa = XXTfakerGetinfo(bid[name][2])['IDFA']
		return checkidfa(bid[name][1],idfa)
	end
end





function rd(n,k)
	return math.random(n,k)
end

function appname(bid)
	return app.localized_name(bid) or '未安装'
end


apparr={}
apparr.right={{{462,666,0x007aff},{225,666,0x007aff},}, 85, 54, 394, 590, 809}

function newidfa(name,times)
	for i= 1,times do

		local TIMEline = os.time()
		local OUTtime = rd(30,40)
		while os.time()- TIMEline < OUTtime do
			if active(bid[name][2],4)then
				if d(apparr.right,"apparr.right",true)then

				else
					moveTo(600,300,100,100,30,50)
					delay(1)
					click(321, 978)
					delay(1)
					click(462, 666)
					delay(1)
				end
			else
				log("启动一次")
			end
		end
		up(name,'排重成功')

	end
end

--期货掌中宝
function beewallidfa(name)
	if idfaisok(name)then
		if clickidfa(idfa)then
			newidfa(name,1)
			if activeLink(idfa) then
				up(name,'激活成功')
			end
		end
	end
	delay(1)
end

while true do
	log("vpn-key")
	if vpn() then
		if checkip()then
			beewallidfa("小米贷款")
		end
	end
	for _,bid in ipairs(app.bundles()) do
		app.quit(bid)
	end
	sys.msleep(2000)
	vpnx()
end






































