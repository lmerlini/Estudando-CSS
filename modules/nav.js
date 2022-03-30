function nav(target, ...name) {
	const $ = document;

	let menu;
	let createList;
	try {
		let element = $.querySelector(target)

	
		name.forEach(function(e){
			let link = $.createElement('a')
			console.log(link)
			let text = $.createTextNode(e.text)
			let attr = $.createAttribute()
			
			link.appendChild(text)
			
		})


		window.onload = function() {
			element.innerHTML = ` 
		<header class="header">
			<a href="/">LOGO</a>
			<nav>
				<ul class="menu">
					<li><a href="./grid.html">Grid 1</a></li>
					<li><a href="./grid2.html">Grid 2</a></li>
					<li><a href="./testmodule.html">Teste Module</a></li>
				</ul>
			</nav>
		</header>		
		`
		}
	} catch (e) {
		//TODO..../
	}
}

export {
	nav
}
