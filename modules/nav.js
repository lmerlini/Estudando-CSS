function nav(target, ...name) {
	const $ = document;

	if (!target) {
		throw new Error('Não foi recebido o parametro Target');
	}

	if ((!name.length) || (typeof name != 'object')) {
		throw new Error('Segundo parametro não é um objeto');
	}

	try {
		let element = $.querySelector(target)
		name.forEach(function(e) {
			let ul = $.querySelector('#ul');
			let li = $.createElement('li')
			let a = $.createElement('a')

			a.setAttribute('href', e.url)
			a.appendChild($.createTextNode(e.text))

			ul.appendChild(li)
			li.appendChild(a)

		})

	} catch (e) {
		//TODO..../
	}
}

export {
	nav
}
