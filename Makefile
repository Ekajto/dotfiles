.PHONY: update
update:
	nix run .#homeConfigurations.${USER_PROFILE}.activationPackage

.PHONY: clean
clean:
	nix-collect-garbage -d
