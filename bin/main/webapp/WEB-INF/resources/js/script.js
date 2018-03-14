// extend wowslider for effect support
(function($){
	// amount of lates effects
	var effects = 10;

	// all effects list
	var allEfects = "cube_over|louvers|tv|lines|carousel|dribbles|parallax|brick|collage|photo|basic|basic_linear|blast|blinds|blur|book|bubbles|carousel_basic|cube|domino|fade|flip|fly|glass_parallax|kenburns|page|rotate|seven|slices|squares|stack|stack_vertical".split("|");

	var effectsPath = (SITE_URL || 'http://wowslider.com/')+'images/effects/';

	
	
	var cSlide, bkpCont, wowInstance, firstInitBtns;

	// rewrite slider
	// window.wowReInitor = function (wow,options){
	var default_wowSlider = $.fn.wowSlider;
	var default_options;
	var newOptions;
	$.fn.wowSlider = function (options) {
		if(!default_options) {
			default_options = options;
		}
		var wow = $(this);
		if(!newOptions) {
			newOptions = $.extend({},options);
		}
		// add current effect if no in effects list
		/*
		if (newOptions.effect && (effects.join("|").indexOf(newOptions.effect)<0))
			effects[effects.length] = newOptions.effect;
		*/

		// add fullscreen api
		newOptions.fullScreen = true;

		// change sizes when click on device buttons
		if(!firstInitBtns) {
			firstInitBtns = 1;

			if(wow.attr('data-fullscreen')) {
				wow.parent().css('max-width', 'none');
			}

			if(wow.attr('data-no-devices')) {
				$('#devices').remove();
			} else {
				controlDeviceButtons(wow, function(newOpts) {
					if(newOptions.responsive !== newOpts.responsive) {
						newOptions.responsive = newOpts.responsive;
						newOptions.forceStart = 0;
						wowReInitor(wowInstance, newOptions);
					}
				});

				if(newOptions.responsive == 2) {
					$('#devices a.fullwidth').click();
				}
			}

			if(wow.attr('data-effects')) {
				$('#devices').remove();
				allEfects = wow.attr('data-effects').split("|");
			}
		}

		// get new effect script, then start
		$.getScript(effectsPath+newOptions.effect+".js", function(){
			newOptions.support = default_wowSlider.support;

			// change duration in brick effect
			if(newOptions.effect == 'brick') newOptions.duration = 5500;
			else newOptions.duration = default_options.duration;

			// recreate html or init effects
			if (!bkpCont){//first start
				bkpCont = $(document.createElement("div")).append(wow.clone()).html();	
				
				createEffects(function(eff){
					newOptions.effect = eff;
					newOptions.forceStart = 1;
					wowReInitor(wowInstance, newOptions);
					//reinitSlider(new_o);
				});

				selectEffect(newOptions.effect);
			}
			else {
				wow.get(0).wsStop();
				wow = $(bkpCont).replaceAll(wow);
			}
			
			wowInstance = wow; // save instance for effect
			
			if (!newOptions.effect)
				newOptions.effect = (allEfects[Math.floor(Math.random()*allEfects.length)]) || "blinds";
			var new_opt = $.extend({
				startSlide:cSlide,
				onStep:function(num){cSlide=num}
			},newOptions);
			
			// run slider
			//var result = wow.wowSlider(new_opt); 
			var result = default_wowSlider.apply(wow, [new_opt]); 
			
			if (isNaN(cSlide))
				cSlide = 0;
			else if(newOptions.forceStart)
				wow.get(0).wsStart(cSlide+1);
				
			selectEffect(new_opt.effect);

			return result;
		});
	}
	
	// for old compability
	window.wowReInitor = function (wow,options){
		$(wow).wowSlider(options);
	};
})(jQuery);