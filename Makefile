.PHONY: update
update:
	nix run .#homeConfigurations.work.activationPackage
