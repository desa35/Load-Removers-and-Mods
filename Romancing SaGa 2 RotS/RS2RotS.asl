state("Romancing SaGa 2 RotS-Win64", "101")
{
	bool load : "Romancing SaGa 2 RotS-Win64.exe", 0x5CFBBF0, 0x58, 0x198, 0xF0, 0x5A8, 0x100;
	byte load2 : "Romancing SaGa 2 RotS-Win64.exe", 0x57EFB20, 0x2A8, 0x230, 0x708, 0, 0x50, 0x288;
}

state("Romancing SaGa 2 RotS-Win64", "102")
{
	bool load : "Romancing SaGa 2 RotS-Win64.exe", 0x5A21240, 0x400, 0x60, 0xF0, 0x5A8, 0x100;
	byte load2 : "Romancing SaGa 2 RotS-Win64.exe", 0x5ABE610, 0x118, 0x1A8, 0x380, 0xB8, 0x288;
}

startup
{
	vars.crash = false;
}

update
{
	if (current.load)
		vars.crash = false;
}


init
{
	timer.IsGameTimePaused = false;
	
	//print(modules.First().ModuleMemorySize.ToString());
	if (modules.First().ModuleMemorySize == 588587008)
		version = "102";
	else //629063680
		version = "101";
}

exit
{
	timer.IsGameTimePaused = true;
	vars.crash = true;
}

isLoading
{
	return current.load || current.load2 == 1 || vars.crash;
}
