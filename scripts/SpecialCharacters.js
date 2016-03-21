var specialChars = new Array('&#149', '&mdash;', '&cent;', '&copy;', '&reg;', '&trade;', '&frac14;', '&frac12;', '&frac34;');
var specialCharsTooltips = new Array('Bullet', 'EM-Dash', 'Cent', 'Copyright', 'Register', 'Trademark', 'Fraction 1/4', 'Fraction 1/2', 'Fraction 3/4');

function generateSpecialCharButtons(id)
{
	for (var i = 0; i < specialChars.length; i++)
		document.writeln("<input type='button' value='" + specialChars[i] + "' title='" + specialCharsTooltips[i] + "' onclick='insertSpecialChar(\"" + id + "\", \"" + specialChars[i] + "\");' />");
}

function storeCaretPosition(field)
{
	if (field.createTextRange)
		field.caretPos = document.selection.createRange().duplicate();
}

function insertSpecialChar(id, ch)
{
	var field = document.getElementById(id);

	if (field.createTextRange && field.caretPos)
		field.caretPos.text = ch;
	else if (field.setSelectionRange)
		field.value = field.value.substring(0, field.selectionStart) + ch + field.value.substring(field.selectionEnd, field.value.length);
	else
		field.value = field.value + ch;

	field.focus();
}
