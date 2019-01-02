window.Toast = (function(Toast) {

    Toast = function(element, options) {

        if(!element) {
            return
        }
        this.container = document.querySelector(element);
        this.element;
        this.options = options || {};
        this.options.interval = this.options.interval || 3000;
        this.text = this.options.text[0] || [];
        this.current = 0;
        this.total = this.text.length;
        this.timer;
        this.isInit = false;
        this.init();

    }

    Toast.prototype = {

        init: function() {
            
            var self = this;

            this.button = document.createElement('button');
            this.button.setAttribute('class', 'button button-close');
            this.container.appendChild(this.button);
            this.append(this.text);

            this.container.addEventListener('click', function(e) {
                var target = e.target;
                if (target && target.nodeName === 'BUTTON' && self.hasClass(target, 'button-close')) {
                    self.hidden();
                }
            });

        },
        add: function(text) {

            for(var i=0, length=text.length; i<length; i++) {
                this.text.push(text[i]);
            }
            this.append(text);

        },
        append: function(text) {

            for(var i=0, length=text.length; i<length; i++) {
                var div = document.createElement('div'),
                    wrap = document.createElement('div'),
                    className = (i==0 && this.isInit == false) ? ' attached' : '';

                div.setAttribute('class', 'notification-item' + className);
                wrap.setAttribute('class', 'notification-item-body');
                wrap.innerHTML = text[i];
                div.appendChild(wrap);
                this.container.insertBefore(div, this.button);
            }
            this.total = this.text.length;
            this.element = this.container.querySelectorAll('.notification-item');
            if(!this.isInit) {
                this.play();
            }
            this.isInit = true;

        },
        isAtEnd: function() {

            return this.current === this.total - 1;

        },
        autoSlide: function(callback) {

            this.detached(this.current);
            if(this.isAtEnd()) {
                this.current = 0;
            } else {
                this.current++;
            }
            this.attached(this.current);

            if(callback && typeof callback == "function") {
                callback();
            }

        },
        slide: function(index) {

            this.detached(this.current);
            this.attached(index);

        },
        play: function() {

            var self = this;
            
            this.timer = setTimeout(function() {
                self.autoSlide(function() {
                    self.play();
                });
            }, self.options.interval);
            
        },
        pause: function() {

            if(this.timer) {
                clearTimeout(this.timer);
            }

        },
        attached: function(index) {

            this.addClass(this.element[index], 'attached');

        },
        detached: function(index) {

            this.removeClass(this.element[index], 'attached');

        },
        hidden: function() {

            this.addClass(this.container, 'hidden');
            this.container.setAttribute('aria-hidden','true');
            this.pause();

        },
        addClass: function (element, className) {
			if (element.classList) {
				element.classList.add(className);
			} else if (!this.hasClass(element, className)) {
				element.className += ' ' + className;
			}
		},
		removeClass: function (element, className) {
			if (element.classList) {
				element.classList.remove(className);
			} else {
				element.className = element.className.replace(new RegExp('\\b' + className + '\\b', 'g'), '');
			}
		},
        hasClass: function (element, className) {
			return (element.classList) ? element.classList.contains(className) : new RegExp('\\b' + className + '\\b').test(element.className);
		}
    }

    return Toast;

})(window.Toast || {});