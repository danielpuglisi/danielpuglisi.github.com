/* Use this script if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'pulleasy\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-github' : '&#x21;',
			'icon-twitter' : '&#x23;',
			'icon-feed' : '&#x24;',
			'icon-flickr' : '&#x25;',
			'icon-paragraph-justify' : '&#x26;',
			'icon-link' : '&#x27;',
			'icon-share' : '&#x28;',
			'icon-instagram' : '&#x29;',
			'icon-vimeo' : '&#x22;',
			'icon-pinterest' : '&#x2a;',
			'icon-stumbleupon' : '&#x2b;',
			'icon-lastfm' : '&#x2c;',
			'icon-soundcloud' : '&#x2d;',
			'icon-youtube' : '&#x2e;',
			'icon-dribbble' : '&#x2f;',
			'icon-forrst' : '&#x30;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, html, c, el;
	for (i = 0; i < els.length; i += 1) {
		el = els[i];
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c) {
			addIcon(el, icons[c[0]]);
		}
	}
};