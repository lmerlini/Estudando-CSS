[33mcommit 934562d1360a3639560f08674e5a232838586c72[m[33m ([m[1;36mHEAD -> [m[1;32mmaster[m[33m)[m
Author: Luis Merlini <merliniluis@gmail.com>
Date:   Wed Mar 30 00:32:37 2022 -0300

    Criei alguns módulos de JS conforme a documentaçao do Mozilla, ate aqui está tudo certo o estudo. O menu de navegação esta funcional, num arquivo a parte dentro da pasta JS nav.js.

[1mdiff --git a/css/style.css b/css/style.css[m
[1mindex 60e0085..e3f67a6 100644[m
[1m--- a/css/style.css[m
[1m+++ b/css/style.css[m
[36m@@ -78,10 +78,6 @@[m [ma {[m
 	text-align: center;[m
 }[m
 [m
[31m-#app {[m
[31m-	margin-bottom: 6.25rem !important;[m
[31m-}[m
[31m-[m
 .grid1>div {[m
 	align-items: center;[m
 }[m
[36m@@ -150,11 +146,12 @@[m [ma {[m
 	.sidebar {[m
 		display: grid;[m
 		grid-template-columns: repeat(2, 1fr);[m
[31m-		gap: 1.125rem;		[m
[32m+[m		[32mgap: 1.125rem;[m
 	}[m
[31m-	.sidebar>div>img{[m
[32m+[m
[32m+[m	[32m.sidebar>div>img {[m
 		max-height: 22rem;[m
 		margin: 0 auto;[m
[31m-		[m
[32m+[m
 	}[m
 }[m
[1mdiff --git a/js/index.js b/js/index.js[m
[1mnew file mode 100644[m
[1mindex 0000000..f0874e2[m
[1m--- /dev/null[m
[1m+++ b/js/index.js[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32mimport nav from './nav.js'[m
[1mdiff --git a/js/nav.js b/js/nav.js[m
[1mnew file mode 100644[m
[1mindex 0000000..262520d[m
[1m--- /dev/null[m
[1m+++ b/js/nav.js[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32mimport {[m
[32m+[m	[32mnav[m
[32m+[m[32m} from '../modules/nav.js'[m
[32m+[m
[32m+[m[32mexport default nav('#app', {[m
[32m+[m	[32murl: './index.html',[m
[32m+[m	[32mtext: 'Index'[m
[32m+[m[32m}, {[m
[32m+[m	[32murl: './grid.html',[m
[32m+[m	[32mtext: 'Grid 1'[m
[32m+[m[32m}, {[m
[32m+[m	[32murl: './grid2.html',[m
[32m+[m	[32mtext: 'Grid 2'[m
[32m+[m[32m}, {[m
[32m+[m	[32murl: './testmodule.html',[m
[32m+[m	[32mtext: 'teste Module'[m
[32m+[m[32m});[m
[1mdiff --git a/main.js b/js/square.js[m
[1msimilarity index 78%[m
[1mrename from main.js[m
[1mrename to js/square.js[m
[1mindex 8741e5b..cbd518a 100644[m
[1m--- a/main.js[m
[1m+++ b/js/square.js[m
[36m@@ -10,11 +10,6 @@[m [mimport {[m
 } from './modules/square.js';[m
 import randomSquare from './modules/square.js';[m
 [m
[31m-import {[m
[31m-	nav[m
[31m-} from './modules/nav.js'[m
[31m-[m
[31m-[m
 let myCanvas = create('myCanvas', document.body, 480, 320);[m
 let reportList = createReportList(myCanvas.id);[m
 [m
[36m@@ -26,13 +21,3 @@[m [mreportPerimeter(square1.length, reportList);[m
 let square2 = randomSquare(myCanvas.ctx);[m
 [m
 [m
[31m-nav('#app', [m
[31m-{	[m
[31m-	url: './grid.html',[m
[31m-	text: 'Grid 1'[m
[31m-}, [m
[31m-{[m
[31m-	url: './grid2.html',[m
[31m-	text: 'Grid 2'[m
[31m-});[m
[31m-[m
[1mdiff --git a/modules/nav.js b/modules/nav.js[m
[1mindex aa5271b..3aa4ec8 100644[m
[1m--- a/modules/nav.js[m
[1m+++ b/modules/nav.js[m
[36m@@ -1,37 +1,29 @@[m
 function nav(target, ...name) {[m
 	const $ = document;[m
 [m
[31m-	let menu;[m
[31m-	let createList;[m
[32m+[m	[32mif (!target) {[m
[32m+[m		[32mthrow new Error('Não foi recebido o parametro Target');[m
[32m+[m	[32m}[m
[32m+[m
[32m+[m	[32mif ((!name.length) || (typeof name != 'object')) {[m
[32m+[m		[32mthrow new Error('Segundo parametro não é um objeto');[m
[32m+[m	[32m}[m
[32m+[m
 	try {[m
 		let element = $.querySelector(target)[m
[32m+[m		[32mname.forEach(function(e) {[m
[32m+[m			[32mlet ul = $.querySelector('#ul');[m
[32m+[m			[32mlet li = $.createElement('li')[m
[32m+[m			[32mlet a = $.createElement('a')[m
 [m
[31m-	[m
[31m-		name.forEach(function(e){[m
[31m-			let link = $.createElement('a')[m
[31m-			console.log(link)[m
[31m-			let text = $.createTextNode(e.text)[m
[31m-			let attr = $.createAttribute()[m
[31m-			[m
[31m-			link.appendChild(text)[m
[31m-			[m
[31m-		})[m
[32m+[m			[32ma.setAttribute('href', e.url)[m
[32m+[m			[32ma.appendChild($.createTextNode(e.text))[m
[32m+[m
[32m+[m			[32mul.appendChild(li)[m
[32m+[m			[32mli.appendChild(a)[m
 [m
[32m+[m		[32m})[m
 [m
[31m-		window.onload = function() {[m
[31m-			element.innerHTML = ` [m
[31m-		<header class="header">[m
[31m-			<a href="/">LOGO</a>[m
[31m-			<nav>[m
[31m-				<ul class="menu">[m
[31m-					<li><a href="./grid.html">Grid 1</a></li>[m
[31m-					<li><a href="./grid2.html">Grid 2</a></li>[m
[31m-					<li><a href="./testmodule.html">Teste Module</a></li>[m
[31m-				</ul>[m
[31m-			</nav>[m
[31m-		</header>		[m
[31m-		`[m
[31m-		}[m
 	} catch (e) {[m
 		//TODO..../[m
 	}[m
[1mdiff --git a/public/404.html b/public/404.html[m
[1mindex 57db2e9..0d3a392 100644[m
[1m--- a/public/404.html[m
[1m+++ b/public/404.html[m
[36m@@ -1 +1,23 @@[m
[31m-404[m
\ No newline at end of file[m
[32m+[m[32m<!DOCTYPE html>[m
[32m+[m[32m<html>[m
[32m+[m	[32m<head>[m
[32m+[m		[32m<meta charset="utf-8" />[m
[32m+[m		[32m<meta name="viewport" content="width=device-width, initial-scale=1">[m
[32m+[m		[32m<title></title>[m
[32m+[m	[32m</head>[m
[32m+[m	[32m<body>[m
[32m+[m		[32m<header class="header">[m
[32m+[m			[32m<a href="/">LOGO</a>[m
[32m+[m			[32m<nav>[m
[32m+[m				[32m<ul id="ul" class="menu">[m
[32m+[m					[32m<div id="app"></div>[m
[32m+[m				[32m</ul>[m
[32m+[m			[32m</nav>[m
[32m+[m		[32m</header>[m
[32m+[m
[32m+[m		[32m<main>[m
[32m+[m			[32m<h1>404</h1>[m
[32m+[m		[32m</main>[m
[32m+[m		[32m<script type="module" src="../js/index.js"></script>[m
[32m+[m	[32m</body>[m
[32m+[m[32m</html>[m
[1mdiff --git a/public/grid.html b/public/grid.html[m
[1mindex 440027c..8b64b24 100644[m
[1m--- a/public/grid.html[m
[1m+++ b/public/grid.html[m
[36m@@ -7,7 +7,14 @@[m
 		<link rel="stylesheet" href="../css/style.css">[m
 	</head>[m
 	<body>[m
[31m-		<div id="app"></div>[m
[32m+[m		[32m<header class="header">[m
[32m+[m			[32m<a href="/">LOGO</a>[m
[32m+[m			[32m<nav>[m
[32m+[m				[32m<ul id="ul" class="menu">[m
[32m+[m					[32m<div id="app"></div>[m
[32m+[m				[32m</ul>[m
[32m+[m			[32m</nav>[m
[32m+[m		[32m</header>[m
 [m
 		<section class="grid1">[m
 			<div>[m
[36m@@ -62,23 +69,6 @@[m
 			</div>[m
 [m
 		</section>[m
[31m-		<script type="text/javascript">[m
[31m-			const $ = document[m
[31m-			const app = $.querySelector('#app')[m
[31m-			window.onload = function() {[m
[31m-				app.innerHTML = `[m
[31m-					<header class="header">[m
[31m-						<a href="/">LOGO</a>[m
[31m-						<nav>[m
[31m-							<ul class="menu">[m
[31m-								<li><a href="./grid.html">Grid 1</a></li>[m
[31m-								<li><a href="./grid2.html">Grid 2</a></li>[m
[31m-								<li><a href="./testmodule.html">Teste Module</a></li>[m
[31m-							</ul>[m
[31m-						</nav>[m
[31m-					</header>				[m
[31m-				`[m
[31m-			}[m
[31m-		</script>[m
[32m+[m		[32m<script type="module" src="../js/index.js"></script>[m
 	</body>[m
 </html>[m
[1mdiff --git a/public/grid2.html b/public/grid2.html[m
[1mindex 7aceeaa..6f36ec3 100644[m
[1m--- a/public/grid2.html[m
[1m+++ b/public/grid2.html[m
[36m@@ -11,7 +11,15 @@[m
 	</head>[m
 	<body>[m
 [m
[31m-		<div id="app"></div>[m
[32m+[m		[32m<header class="header">[m
[32m+[m			[32m<a href="/">LOGO</a>[m
[32m+[m			[32m<nav>[m
[32m+[m				[32m<ul id="ul" class="menu">[m
[32m+[m					[32m<div id="app"></div>[m
[32m+[m				[32m</ul>[m
[32m+[m			[32m</nav>[m
[32m+[m		[32m</header>[m
[32m+[m
 		<section class="grid2">[m
 			<div class="video">[m
 				<img src="https://via.placeholder.com/1270x700/ffffaa/808080%20?Text=Digital.com" alt="">[m
[36m@@ -38,7 +46,7 @@[m
 			</div>[m
 		</section>[m
 [m
[31m-		<script type="text/javascript">[m
[32m+[m		[32m<!-- 		<script type="text/javascript">[m
 			const $ = document[m
 			const app = $.querySelector('#app')[m
 			window.onload = function() {[m
[36m@@ -55,6 +63,7 @@[m
 					</header>				[m
 				`[m
 			}[m
[31m-		</script>[m
[32m+[m		[32m</script> -->[m
[32m+[m		[32m<script type="module" src="../js/index.js"></script>[m
 	</body>[m
 </html>[m
[1mdiff --git a/public/index.html b/public/index.html[m
[1mindex e506587..727124d 100644[m
[1m--- a/public/index.html[m
[1m+++ b/public/index.html[m
[36m@@ -16,18 +16,13 @@[m
 		<header class="header">[m
 			<a href="/">LOGO</a>[m
 			<nav>[m
[31m-				<ul class="menu">[m
[31m-					<li><a href="./grid.html">Grid 1</a></li>[m
[31m-					<li><a href="./grid2.html">Grid 2</a></li>[m
[31m-					<li><a href="./testmodule.html">Teste Module</a></li>[m
[32m+[m				[32m<ul id="ul" class="menu">[m
[32m+[m					[32m<div id="app"></div>[m
 				</ul>[m
 			</nav>[m
 		</header>[m
 [m
 [m
[31m-		<div id="app"></div>[m
[31m-[m
[31m-[m
 		<h1>Seção do flexbox</h1>[m
 		<section class="flex">[m
 			<div>[m
[36m@@ -55,7 +50,7 @@[m
 			</div>[m
 		</section>[m
 [m
[31m-		<script type="module" src="../main.js"></script>[m
[32m+[m		[32m<script type="module" src="../js/index.js"></script>[m
 [m
 	</body>[m
 </html>[m
[1mdiff --git a/public/testmodule.html b/public/testmodule.html[m
[1mindex 3d47e9d..aab051f 100644[m
[1m--- a/public/testmodule.html[m
[1m+++ b/public/testmodule.html[m
[36m@@ -8,7 +8,7 @@[m
 				border: 1px solid black;[m
 			}[m
 		</style>[m
[31m-		<script type="module" src="../main.js"></script>[m
[32m+[m		[32m<script type="module" src="../js/index.js"></script>[m
 	</head>[m
 	<body>[m
 [m
