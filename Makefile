.PHONY: update
update:
	nix run .#homeConfigurations.work.activationPackage

.PHONY: clean
clean:
	nix-collect-garbage -d
