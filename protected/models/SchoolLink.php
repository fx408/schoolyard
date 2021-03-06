<?php

/**
 * This is the model class for table "school_link".
 *
 * The followings are the available columns in table 'school_link':
 * @property integer $id
 * @property integer $school_id
 * @property string $title
 * @property string $url
 * @property integer $create_user
 * @property integer $create_time
 */
class SchoolLink extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return SchoolLink the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'school_link';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('school_id, title, url, create_time', 'required'),
			array('school_id, create_user, create_time', 'numerical', 'integerOnly'=>true),
			array('title', 'length', 'max'=>20),
			array('url', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, school_id, title, url, create_user, create_time', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'school_id' => 'School',
			'title' => 'Title',
			'url' => 'Url',
			'create_user' => 'Create User',
			'create_time' => 'Create Time',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('school_id',$this->school_id);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('url',$this->url,true);
		$criteria->compare('create_user',$this->create_user);
		$criteria->compare('create_time',$this->create_time);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	// 根据学校ID ，查询链接
	public function listBySchoolId($school_id) {
		$criteria=new CDbCriteria;
		$criteria->compare('school_id', $school_id);
		
		$data = $this->findAll($criteria);
		
		return DataHelper::eachData($data, 'id');
	}
}