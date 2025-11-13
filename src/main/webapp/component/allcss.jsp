<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          brand: '#059669', // A nice emerald green
          brandhover: '#047857',
        }
      }
    }
  }
</script>

<style>
    .glass-card {
        background: white;
        border-radius: 1rem; /* rounded-xl */
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04); /* shadow-xl */
        border: 1px solid #f3f4f6;
    }
    .table-header {
        background-color: #f9fafb;
        text-transform: uppercase;
        font-size: 0.75rem;
        font-weight: 700;
        color: #4b5563;
        letter-spacing: 0.05em;
    }
</style>