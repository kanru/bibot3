all: Bibot.dll bot.exe

Bibot.dll: src/Core.n src/IPlugin.n src/AssemblyInfo.n
	ncc $^ -o lib/$@ -t:library -r:lib/Meebey.SmartIrc4net.dll
bot.exe: lib/Bibot.dll src/bot.n
	ncc src/bot.n -o $@ -t:exe -r:lib/Bibot.dll
plugins: src/CorePlugin.n src/EchoPlugin.n
	ncc src/CorePlugin.n -o Plugins/CorePlugin -t:library -r:lib/Bibot.dll
	ncc src/EchoPlugin.n -o Plugins/EchoPlugin -t:library -r:lib/Bibot.dll

clean:
	-rm -f lib/Bibot.dll
