# godot-save-editor
a basic save editor for encrypted godot files

a save/godot file using
```gdscript
FileAccess.open_encrypted_with_pass()
```
[link](https://docs.godotengine.org/en/stable/classes/class_fileaccess.html#class-fileaccess-method-open-encrypted)
can be opened with this program assuming you know the password used, which is likely hardcoded into the program and can be found using [gdre](https://github.com/bruvzg/gdsdecomp) and a little bit of patience

only supports password strings and string data, no binary or anything else because the file i was editing only used strings and i didnt bother.
if you want it you can pr or if enough people want it i can actually put effort into this
thank you good day
