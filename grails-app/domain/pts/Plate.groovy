package pts

class Plate {
	String intPlateId
	String extPlateId
	String reactionSize
	String enzymeUsed
	String pcrCondition
	String createdBy
	String chipId
	String createdDate
	
	PlateType plateType // Many to one
	Project project 	// Many to one
	
	// Use belongs to if you want ON DELETE CASCADE
	// static belongsTo = [parentPlate: Plate] 
	static hasMany = [childrenPlate: Plate, sampleInPlate: SampleInPlate]
	
    static constraints = {
		project nullalbe: false
		
		intPlateId size: 1..8, blank: false, nullable: false, unique: true
		extPlateId size: 1..8, blank: false, nullable: false, unique: true
		plateType nullable: false
		
		createdBy size: 1..24
		createdDate nullable: true
		
		childrenPlate nullable: true
		
		enzymeUsed inList: ['Qiagen', 'Kappa'], nullable: true
		pcrCondition inList: ['Normal', '58C'], nullable: true
		reactionSize inList: ['Half', 'Full'], nullable: true
		
		chipId nullable: true
    }
	
	public String toString()
	{
		return intPlateId
	}
}
