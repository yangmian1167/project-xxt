
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


bid.期货掌中宝 = { 1324945454,"com.qihuozhangzhongbao"}
bid.乐米乐得彩票 = { 1374153336,"com.micai.lede01"}
bid.二九真人游戏 = { 1367850213 ,"com.KaiyuYang.rjyx"}
bid.阅多多 = { 1347053441 , "com.kxhl.mofang" }
bid.安小财 = { 1359007250 , "com.anchuang.www" }
bid.自如 = {	["appid"] =  "685872176", ["appbid"] = "com.ziroom.ZiroomProject", ["id"]= 253, ["keyword"]="自如" }


screen.init(0)
var = {}
var.lun = 0
var.adid = "159573638dbf9b"
var.channel = ""
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


function get_task(name)
	local url = "http://cs.3185565.com/?m=Api&c=Wwt&a=get_task"
	local postArr={}
	postArr.AppleId = bid[name]["appid"]
	postArr.ChannelID = 23
	postArr.IDFA = "idfa"
	postArr.IP = IP or get_ip()
	postArr.MAC = "08:00:20:0A:8C:6D"
	local feedback = post(url,postArr)
	
	if feedback ~= nil then
		local data = json.decode(feedback)
		log(data or "nil")
	end

	
end

get_task("自如")

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
		newidfa(name,1)
		if activeLink(name,idfa) then
			up(name,'激活成功')
		end
	end
	delay(1)
end







































