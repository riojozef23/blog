@props(['active'=>false])

<a {{ $attributes }}
    class="block rounded-md px-3 py-2 text-base font-medium {{ $active ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white' }}"
    aria-current="{{ $active ? 'page': false }}">{{ $slot }}
</a>
