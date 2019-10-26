// from data.js
var ufoTable = data;

// YOUR CODE HERE!
var tbody = d3.select("tbody");

function buildTable(data) {

    tbody.html("");

    data.forEach((dataRow) => {

        var row = tbody.append("tr");

        Object.values(dataRow).forEach((val) => {

            var cell = row.append("td");

              cell.text(val);
            }
            );
          });
        }

function handleClick() {

var date = d3.select("#datetime").property("value");
    let filteredufo = ufoTable;

if (date) {
 filteredufo = filteredufo.filter(row => row.datetime === date);
}

  buildTable(filteredufo);
}

d3.selectAll("#filter-btn").on("click", handleClick);
        
buildTable(ufoTable);