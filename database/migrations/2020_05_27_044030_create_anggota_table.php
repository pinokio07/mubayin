<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnggotaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anggota', function (Blueprint $table) {
            $table->id();
            $table->integer('aims')->nullable();
            $table->string('nama_lengkap', 255);
            $table->string('home_phone', 255)->nullable();
            $table->string('cell_phone', 255)->nullable();
            $table->string('alamat', 255)->nullable();
            $table->set('tanzim',['AN', 'LI', 'KH', 'NI','AT','BA','AB']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('anggota');
    }
}
