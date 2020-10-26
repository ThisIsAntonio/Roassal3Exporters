Class {
	#name : #RSAFrameExporterTest,
	#superclass : #TestCase,
	#instVars : [
		'imgFloor',
		'aFrameExporter'
	],
	#category : #'Roassal3-Exporters-AFrame-Tests'
}

{ #category : #running }
RSAFrameExporterTest >> setUp [
	super setUp.
	imgFloor 	:= 'https://i.imgur.com/dckg70j.jpg'.
	aFrameExporter := RSAFrameExporter new.
	aFrameExporter stream: (WriteStream on: String new).
]

{ #category : #tests }
RSAFrameExporterTest >> testBox [
	| result box |
	result := '<a-box position="0.0 0.5 0" width=" 0.0 " height=" 0.0" depth=" 0.0" color= "#9F9F9F" change-color-on-hover="color: #E9E9E9" roughness=" 1.0" metalness=" 0.2" event-set__enter="_event: mouseenter;  _target:#idPopUP; visible: true;" event-set__leave="_event: mouseleave;  _target: #idPopUP; visible: false;" ></a-box>'.
	box := RSBox new.
	box printOnAFrame: aFrameExporter.
	self assert: aFrameExporter stream contents equals: result.
]

{ #category : #tests }
RSAFrameExporterTest >> testElipse [
	| result elipse |
	result := '<a-sphere radius="0.0 0.0 0.0" position="0.0 0.5 0" color= "#9F9F9F" change-color-on-hover="color: #E9E9E9" roughness=" 1.0" metalness=" 0.2" event-set__enter="_event: mouseenter;  _target:#idPopUP; visible: true;" event-set__leave="_event: mouseleave;  _target: #idPopUP; visible: false;" ></a-sphere>'.
	elipse := RSEllipse new.
	elipse printOnAFrame: aFrameExporter.
	self assert: aFrameExporter stream contents equals: result.
]

{ #category : #tests }
RSAFrameExporterTest >> testImage [
	"Check it is Ok floorImgBase64"	
	| stream |
	stream := RSAFrameExporter new.
	self assert: stream floorImg  equals: imgFloor.
]

{ #category : #tests }
RSAFrameExporterTest >> testLabel [
	| result label |
	result := '<a-entity position="0.6 0.5 0" text="width: 1.5; color: #808080; value:hello world" ></a-entity>'.
	label := RSLabel new.
	label text: 'hello world'.
	label printOnAFrame: aFrameExporter.
	self assert: aFrameExporter stream contents equals: result.
]

{ #category : #tests }
RSAFrameExporterTest >> testLine [
	| result line |
	result := '<a-entity geometry="primitive: cylinder; radius: 0.003; height:0.8485281374238571" position=" 0.3 0.2 0" rotation=" 0 0 -135.0" material=" color:#404040"></a-entity>'.
	line := RSLine new.
	line printOnAFrame: aFrameExporter.
	self assert: aFrameExporter stream contents equals: result.
]

{ #category : #tests }
RSAFrameExporterTest >> testPopUp [
	| result box |
	result := '<a-box model="Collection" position="0.0 0.5 0" width=" 0.0 " height=" 0.0" depth=" 0.0" color= "#9F9F9F" change-color-on-hover="color: #E9E9E9" roughness=" 1.0" metalness=" 0.2" event-set__enter="_event: mouseenter;  _target:#idPopUP; visible: true;" event-set__leave="_event: mouseleave;  _target: #idPopUP; visible: false;" ></a-box>'.
	box := RSBox new.
	box model: Collection. 
	box printOnAFrame: aFrameExporter.
	self assert: aFrameExporter stream contents equals: result.
]