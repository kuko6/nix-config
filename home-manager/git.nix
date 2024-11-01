{
	config,
	pkgs,
	...
}: {
	enable = true;
	userName = "Jakub Povinec";
	userEmail = "jakub.povinec@gmail.com";

	extraConfig = {
		init = {
			defaultBranch = "main";
		};
	};
}
