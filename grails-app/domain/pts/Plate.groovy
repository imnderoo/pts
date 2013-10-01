package pts

class Plate {
	String intPlateId
	String extPlateId
	String reactionSize
	String enzymeUsed
	String pcrCondition
	String createdBy
	String chipId
	Date createdDate
	
	PlateType plateType // Many to one
	
	// Use belongs to if you want ON DELETE CASCADE
	// static belongsTo = [parentPlate: Plate] 
	static hasMany = [childrenPlate: Plate, samples: Sample]
	static belongsTo = [project: Project]
	
    static constraints = {
		project nullalbe: false
		
		intPlateId size: 1..8, blank: false, nullable: false, unique: true
		// ExtPlateId is not set to unique because we may test duplicates of the same plate (under different conditions)
		extPlateId size: 1..8, blank: false, nullable: false
		plateType nullable: false
		
		createdBy size: 1..24, nullable: false
		createdDate nullable: false
		
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
