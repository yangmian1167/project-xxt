
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
bid.仙缘萌侠 = { 1389238856 , "com.cygame.xymx" }
bid.天天游棋牌 = { 1241224023 , "com.bdcom.ttygame.appstore" }
bid.酷抓娃娃机 = { 1327161955 , "com.lotogram.zhuagewawa2" }
bid.北京购车 = { 1363907349 , "com.personalcar.www" }
bid.抓娃娃 = { 1278585161 , "com.lotogram.wawaji" }
bid['78u真人电玩'] = { 1373634440 , "com.XiaomaoTu.app" }
bid.人人玩捕鱼 = { 1303413064 , "com.htg.rrfish" }
bid.北京购车 = { 1363907349 , "com.personalcar.www" }
bid.单机斗地主 = { 1234463484 , "com.mofeng.qjmddz" }
bid.抓娃娃 = { 1278585161 , "com.lotogram.wawaji" }
bid.钓鱼 = { 1404681962 , "com.jiong.FaShaoDiaoYu" }
bid.网赚兼职 = { 1394452589 , "com.wngzhuan.bbb" }
bid.熊猫网赚 = { 1417235201 , "com.onePiece.plusa.intentMoney" }
bid.小蜜蜂电玩城 = { 1409651763 , "com.xiaomifeng.qwer" }
bid.萌声 = { 1363033084 , "com.yizhuan.cutesound" }
bid.京东金融 = { 895682747 , "com.jd.jinrong" }
bid.提钱花 = { 1405486905 , "com.btfx.qianbaojingling" }
bid.安信花 = { 1410121980 , "com.jiaoqiannewapp" }
bid.闪光 = { 1386576032 , "com.cnj.shanguang" }
bid.天天游真人电玩 = { 1367955407 , "com.YongbinZhong.tyzr" }
bid.链小白 = { 1407151100 , "net.lxb.ios" }
bid.币事 = { 1403648860 , "com.bshier.bishi" }


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
	idfalist.ip = ip or get_ip() or '192.168.1.1'
	idfalist.account = account
	idfalist.password = password
	idfalist.phone = phone
	idfalist.other = other
	return post(url,idfalist)
end

function checkidfa(appid,idfa)
	local url = "http://111.230.78.86:8080/interface/distinct?appid="..appid.."&idfa="..idfa
	local getdata = get(url)
	if getdata ~= nil then
		local data = json.decode(getdata)
		log(data or "nil")
		if data.err_code == 0 then
			log("idfa: OK.",true)
			return true
		else
			log("idfa, 排重失败",true)
		end
	end
end

function checkip()
	ip = get_ip() or "192.168.1.1"
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

function beesign(appid,idfa)
	local txt = var.source.."|"..appid.."|"..idfa.."|"..var.key
	log("md5---"..txt)
	return string.md5(txt)
end

function activeLink(name,idfa)
	log("开始激活")
	local linkarr={}
	linkarr.appid = bid[name][1]
	linkarr.idfa = idfa
	linkarr.source = "beeplay_waifang1_07"
	linkarr.sign = beesign(bid[name][1],idfa)
	linkarr.ip = ip or get_ip() or "192.168.1.1"
	log(linkarr)
	local url = "http://111.230.78.86:8080/interface/active?appid=".. bid[name][1] .."&idfa=".. idfa .."&source="..var.source.."&sign="..beesign(bid[name][1],idfa).."&ip="..linkarr.ip
	data = get(url)
	if data ~= nil then
		data = json.decode(get(url))
		log(data or "nil")
		if data.err_code == 0 or data.err_msg == "OK." then
			return true
		end
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
		newidfa(name,1)
		if activeLink(name,idfa) then
			up(name,'激活成功')
		end
	end
	delay(1)
end

while true do
	log("vpn-key")
	if vpn() then
		if checkip()then
		--	beewallidfa("天天游真人电玩")
		--	beewallidfa("期货掌中宝")
		--	beewallidfa("天天游棋牌")
		--	beewallidfa("酷抓娃娃机")
		--	beewallidfa("78u真人电玩")
		--	beewallidfa("二九真人游戏")
		--	beewallidfa("期货掌中宝")
		--	beewallidfa("仙缘萌侠")
		--	beewallidfa("北京购车")
		--	beewallidfa("单机斗地主")
		--	beewallidfa("抓娃娃")	
		--	beewallidfa("钓鱼")
		--	beewallidfa("网赚兼职")
		--	beewallidfa("小蜜蜂电玩城")
		--	beewallidfa("电玩翻牌")	
		--	beewallidfa("熊猫网赚")	
		--  beewallidfa("萌声")
		--  beewallidfa("京东金融")
		--  beewallidfa("提钱花")
		--	beewallidfa("安信花")
			beewallidfa("闪光")
		--	beewallidfa("链小白")
		--	beewallidfa("币事")
		
		end
	end
	for _,bid in ipairs(app.bundles()) do
		app.quit(bid)
	end
	sys.msleep(2000)
	vpnx()
end






































