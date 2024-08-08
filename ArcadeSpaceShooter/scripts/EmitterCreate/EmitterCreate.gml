function EmitterCreate(PS, X, Y, width ,height, particle, number){
		var _emitter = part_emitter_create(PS)
		part_emitter_region(PS,_emitter,X,Y,X + width,Y + height,ps_shape_ellipse,ps_distr_linear)
		part_emitter_stream(PS,_emitter,particle,number);

		return _emitter;
}

function EmitterRegionSet(PS, emitter, X, Y, width, height) {
	if (!emitter) return;
	if (!PS) return;
	part_emitter_region(PS,emitter.emitter,X,Y,X + width,Y + height,ps_shape_ellipse,ps_distr_linear)
}