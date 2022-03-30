import {
	create,
	createReportList
} from './modules/canvas.js';
import {
	name,
	draw,
	reportArea,
	reportPerimeter
} from './modules/square.js';
import randomSquare from './modules/square.js';

import {
	nav
} from './modules/nav.js'


let myCanvas = create('myCanvas', document.body, 480, 320);
let reportList = createReportList(myCanvas.id);

let square1 = draw(myCanvas.ctx, 50, 50, 100, 'blue');
reportArea(square1.length, reportList);
reportPerimeter(square1.length, reportList);

// Use the default
let square2 = randomSquare(myCanvas.ctx);


nav('#app', 
{	
	url: './grid.html',
	text: 'Grid 1'
}, 
{
	url: './grid2.html',
	text: 'Grid 2'
});

