<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Eloquent\Model;

class CreateProductsTable extends Migration {

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Model::unguard();
        Schema::create('products',function(Blueprint $table){
            $table->increments("id");
            $table->string("title")->nullable();
            $table->string("photo")->nullable();
            $table->text("description")->nullable();
            $table->tinyInteger("isActive")->default(0)->nullable();
            $table->decimal("price", 15, 2)->nullable();
            $table->integer("categories_id")->references("id")->on("categories")->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('products');
    }

}