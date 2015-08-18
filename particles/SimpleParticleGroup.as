class SimpleParticleGroup extends ParticleGroup{
    //////////// variables ////////////
	
    //////////// Constructor ////////////
    public function SimpleParticleGroup(mods) {
		addMods({velocity:new ParticleVelocity(0,90),wind:new ParticleWindSimulator(20,0.5,90,2,50)});
    }
		
	//////////// Properties functions ////////////
		
	//////////// Public functions ////////////
	
	//////////// Private functions ////////////
	
	//////////// Event Handlers functions ////////////
	
}
