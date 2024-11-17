extends Control

var filePath: String

func openFile() -> void:
	(get_node("password") as TextEdit).editable = false

	(get_node("error") as RichTextLabel).visible = false

	var dialog = (get_node("FileDialog") as FileDialog)
	dialog.show()

func openFileFromDialog(path: String) -> void:
	filePath = path
	var password = (get_node("password") as TextEdit).text

	var file: FileAccess
	if (!password.is_empty()):
		file = FileAccess.open_encrypted_with_pass(path, FileAccess.READ, password)
	else:
		file = FileAccess.open(path, FileAccess.READ)

	if (file == null):
		(get_node("error") as RichTextLabel).text = "an error occured while opening the file for reading: " + str(FileAccess.get_open_error())
		(get_node("error") as RichTextLabel).visible = true

	var data = (get_node("data") as TextEdit)
	data.text = file.get_as_text()
	data.editable = true

	var saveButton = (get_node("save") as Button)
	saveButton.disabled = false

func save() -> void:
	var password = (get_node("password") as TextEdit).text

	var file: FileAccess
	if (!password.is_empty()):
		file = FileAccess.open_encrypted_with_pass(filePath, FileAccess.WRITE, password)
	else:
		file = FileAccess.open(filePath, FileAccess.WRITE)

	if (file == null):
		(get_node("error") as RichTextLabel).text = "an error occured while opening the file for writing: " + str(FileAccess.get_open_error())
		(get_node("error") as RichTextLabel).visible = true

	file.store_string((get_node("data") as TextEdit).text)
	file.close()