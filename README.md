ran with `nix build .#nixosConfigurations.my_machine.config.system.build.toplevel`

output:
```txt
error:
       … while calling the 'seq' builtin
         at /nix/store/235wrv3nhprvagf45y5sd4gfpa9zmmm3-source/lib/modules.nix:403:18:
          402|         options = checked options;
          403|         config = checked (removeAttrs config [ "_module" ]);
             |                  ^
          404|         _module = checked (config._module);

       … while calling the 'throw' builtin
         at /nix/store/235wrv3nhprvagf45y5sd4gfpa9zmmm3-source/lib/modules.nix:375:13:
          374|           else
          375|             throw baseMsg
             |             ^
          376|         else

       error: The option `my_awesome_module' does not exist. Definition values:
       - In `/nix/store/iwqc2rxwl252lj7z6qxki4dk8kzcw603-source/machines/my_machine/configuration.nix':
           {
             enable = true;
           }

       Did you mean `systemd', `appstream' or `console'?

```
