<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laraveldaily\Quickadmin\Observers\UserActionsObserver;


use Illuminate\Database\Eloquent\SoftDeletes;

class Products extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'products';
    
    protected $fillable = [
          'title',
          'photo',
          'description',
          'isActive',
          'price',
          'categories_id'
    ];
    

    public static function boot()
    {
        parent::boot();

        Products::observe(new UserActionsObserver);
    }
    
    public function categories()
    {
        return $this->hasOne('App\Categories', 'id', 'categories_id');
    }


    
    
    
}