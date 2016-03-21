// Mactive Misc JavaScript for the ActiveUI Grid Control

// USAGE:

//  1) At the top of the JSP page, define the following JavaScript vars, for example:
//     <script type="text/javascript">
//       /* the column header texts */
//       var columns = [ "Material Item", "Cost Per Unit", "Units", "Total Cost" ];
//       /* the IDs of the <input> tags where new values are added/updated */
//       var fields  = [ "name", "price", "units", "total" ];
//     </script>

//  2) Add the following #include at the top of the JSP page:
//     <script src="mactive-grid.js"></script>

document.write('<link href="../../../scripts/grid/styles/xp/grid.css" rel="stylesheet" type="text/css"></link>');
document.write('<script src="../../../scripts/grid/activewidgets-grid.js"></script>');

var grid;

// generates the grid table
function showGrid()
{
	// create ActiveWidgets Grid JavaScript object
	grid = new Active.Controls.Grid;

	// set number of rows/columns
	grid.setRowProperty("count", 0);
	grid.setColumnProperty("count", columns.length);

	// set headers width/height
	grid.setRowHeaderWidth("30px");
	grid.setColumnHeaderHeight("24px");

	// prepare empty data source
	grid.source = [];
	grid.setDataProperty("text", function(i, j) { return this.source[i][j] });
	grid.setColumnProperty("text", function(i) { return columns[i] });

	// set action handlers
	grid.setAction("selectRow", handleRowSelection);

	// write the grid
	document.write(grid);
}

// handle row selection
function handleRowSelection(src)
{
	var row = src.getItemProperty("index");

	// highlights the row
	grid.setSelectionProperty("index", row);

	for (var i = 0; i < fields.length; i++)
	{
		var field = document.getElementById(fields[i]);

		if (field)
		{
			if (field.type == 'checkbox')
				field.checked = ((src.getDataProperty("text", i) == 'true') ? "checked" : "");
			else
				field.value = src.getDataProperty("text", i);
		}
	}
}

// add an item
function actionAddItem(row)
{
	if (actionAddItem.arguments.length == 0)
		row = getNewRow();

	if (row != null)
	{
		grid.source[grid.source.length] = row;
		grid.setRowProperty("count", grid.source.length);
		grid.refresh();

		grid.setSelectionProperty("index", grid.source.length - 1);
	}
}

// update an item
function actionUpdateItem()
{
	var index = grid.getSelectionProperty("index");

	if (index >= 0)
	{
		var row = getNewRow();

		if (row != null)
		{
			grid.source[index] = row;
			grid.refresh();
		}
	}
}

// delete an item
function actionDeleteItem()
{
	var index = grid.getSelectionProperty("index");

	if (index >= 0)
	{
		var source = [];

		for (var i = 0; i < grid.source.length; i++)
		{
			if (i != index)
				source[source.length] = grid.source[i];
		}

		grid.source = source;
		grid.setRowProperty("count", grid.source.length);
		grid.refresh();

		grid.setSelectionProperty("index", -1);
	}
}

// collect fielded values for a new/updated row
function getNewRow()
{
	var row = [];

	for (var i = 0; i < fields.length; i++)
	{
		var field = document.getElementById(fields[i]);
		var value = ""

		if (field)
		{
			if (field.type == 'checkbox')
				value = (field.checked ? "true" : "false");
			else
				value = field.value;
		}

		row[row.length] = value;
	}

	// run row finalization function
	if (typeof(validateRow) == 'function')
	{
		if (validateRow(row) == false)
			// row is invalid, return now
			return null;
	}

	// manipulate row data with specific function supplied by specific grid
	if (typeof(finalizeRow) == 'function')
	{
		row = finalizeRow(row);
	}

	return row;
}

// collect data in the grid and write result
function actionExport(name)
{
	var field = document.getElementById(name);
	var result = [];

	if (field)
	{
		for (var i = 0; i < grid.source.length; i++)
			result[result.length] = grid.source[i].join("|");

		field.value = result.join(";");
	}
}
