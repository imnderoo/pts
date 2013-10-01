package pts

class Sample {

	// Are extSampleId and intSampleId the same thing?
	// For now, assume that extSampleId is assigned by

	String sampleId
	String well
	Double sampleVol
	Double dnaAmount
	String dnaSource
	String dnaType
	String dnaExtract
	String comment
	Plate plate

	static belongsTo = [plate:Plate]

	static constraints = {
		sampleId size: 1..12, blank: false, nullable: false
		well size: 1..8, blank: false, nullable: false
		sampleVol min: 0.0D, nullable: false, blank: false
		dnaAmount min: 0.0D, nullable: false, blank: false
		dnaSource size: 1..24
		dnaType size: 1..24
		dnaExtract size: 1..24
		comment size: 1..24

		sampleId (unique: 'plate')
	}

	public String toString() {
		return sampleId
	}
}
