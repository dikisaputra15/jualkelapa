<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasFactory;

    protected $fillable = [
        'kode_pesanan',
        'tgl_pemesanan',
        'nama_pembeli',
        'no_hp',
        'total_harga',
        'metode_pembayaran',
        'status_pembayaran',
        'snap_token',
    ];
}
