<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detailpesanan extends Model
{
    use HasFactory;

    protected $fillable = [
        'pesanan_id',
        'produk_id',
        'qty',
        'harga',
        'subtotal',
    ];
}
