function init()
	page1 = "https://m.sfacg.com/c/[first chapter]/" 
        --输入手机版第一章页面地址
	link = page1
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
	links,linke=string.find(text,"/c/[0-9]+\">下一章")
	if linke then
		linke=linke-11
		link="https://m.sfacg.com"..string.sub(text,links,linke)
	end
	maintxt=string.sub(text,txts+13,txte)
	maintxt=string.gsub(maintxt,"<p>","\n")
	maintxt=string.gsub(maintxt,"</p>","")
	maintxt=string.gsub(maintxt,"<br>","")
	maintxt=string.gsub(maintxt,"</div>","")
	maintxt=string.gsub(maintxt,"</li><li></li></ul>","")
	maintxt=string.gsub(maintxt,"<div class=\"yuedu_menu\"><a href=\"/c/[0-9]+\">","")
	maintxt=string.gsub(maintxt,"<div .+\">","")
end

init()
links=0
io.output(".txt")
while links ~= nil do
	main()
	io.write(maintxt.."\n")
end
io.close()
print("Done")
