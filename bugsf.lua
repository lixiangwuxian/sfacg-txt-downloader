function init()
	link = "https://m.sfacg.com/c/3343280/" 
        --输入手机版第一章页面地址
end

function getpage()
	os.execute("rm index.html\n")
	os.execute("wget -O index.html "..link.."\n")
end

function main()
	getpage()
	text = io.input("index.html")
	text = io.read("*a")
	i,txts=string.find(text,"返回<")
	txte=string.find(text,">上一章")
	if(txte==nil) then
		
	end
	links,linke=string.find(text,"/c/[0-9]+\">下一章")
	if linke then
		linke=linke-11
		link="https://m.sfacg.com"..string.sub(text,links,linke)
	end
	maintxt=string.sub(text,txts+13,txte)
	maintxt=string.gsub(maintxt,"<p>","")
	maintxt=string.gsub(maintxt,"</p>","\n")
	maintxt=string.gsub(maintxt,"<br>","")
	maintxt=string.gsub(maintxt,"</div>","")
	maintxt=string.gsub(maintxt,"</li><li></li></ul>","")
	maintxt=string.gsub(maintxt,"<div class=\"yuedu_menu\"><a href=\"/[c,i]/[0-9]+\">","")
	maintxt=string.gsub(maintxt,"<div style=\"text-indent: 2em;\">","")
end

init()
links=0
io.output("114.txt")
while links ~= nil do
	main()
	io.write(maintxt.."\n")
end
io.close()
print("下载完成")
