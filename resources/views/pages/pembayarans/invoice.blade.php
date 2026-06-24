@extends('layouts.app')

@section('title', 'Cetak Struk')

@section('main')

<style>
.receipt {
    width: 300px;
    margin: auto;
    background: #fff;
    padding: 10px;
    font-family: "Courier New", monospace;
    font-size: 12px;
    color: #000;
}

.receipt-header {
    text-align: center;
}

.separator {
    border-top: 1px dashed #000;
    margin: 8px 0;
}

.item-row {
    margin-bottom: 8px;
}

.item-name {
    font-weight: bold;
}

.item-detail {
    display: flex;
    justify-content: space-between;
}

.total-row {
    display: flex;
    justify-content: space-between;
    font-weight: bold;
    font-size: 14px;
}

.text-center {
    text-align: center;
}

@media print {

    body * {
        visibility: hidden;
    }

    .receipt,
    .receipt * {
        visibility: visible;
    }

    .receipt {
        position: absolute;
        left: 0;
        top: 0;
        width: 80mm;
    }

    .no-print {
        display: none !important;
    }
}
</style>

<div class="container">

    <div class="receipt">

        <div class="receipt-header">
            <h4 style="margin:0;">ANEKA KELAPA</h4>
            <small>Terima Kasih Telah Berbelanja</small>
        </div>

        <div class="separator"></div>

        <div>
            No : {{ $pesanan->kode_pesanan }}<br>
            Tgl : {{ date('d/m/Y H:i', strtotime($pesanan->tgl_pemesanan)) }}<br>
            Cust : {{ $pesanan->nama_pembeli }}
        </div>

        <div class="separator"></div>

        @foreach($detailPesanan as $detail)

        <div class="item-row">

            <div class="item-name">
                {{ $detail->nama_produk }}
            </div>

            <div class="item-detail">
                <span>
                    {{ $detail->qty }} x
                    {{ number_format($detail->harga,0,',','.') }}
                </span>

                <span>
                    {{ number_format($detail->subtotal,0,',','.') }}
                </span>
            </div>

        </div>

        @endforeach

        <div class="separator"></div>

        <div class="total-row">
            <span>TOTAL</span>
            <span>
                Rp {{ number_format($pesanan->total_harga,0,',','.') }}
            </span>
        </div>

        <div class="separator"></div>

        <div>
            Metode : {{ $pesanan->metode_pembayaran }}<br>
            Status : {{ $pesanan->status_pembayaran }}
        </div>

        <div class="separator"></div>

        <div class="text-center">
            *** TERIMA KASIH ***<br>
            Barang yang sudah dibeli<br>
            tidak dapat ditukar/dikembalikan
        </div>

    </div>

    <div class="text-center mt-3 no-print">

        <button onclick="window.print()" class="btn btn-primary">
            <i class="fas fa-print"></i>
            Cetak Struk
        </button>

        <a href="{{ url('/allpesanan') }}"
            class="btn btn-secondary">
            Kembali
        </a>

    </div>

</div>

@endsection
