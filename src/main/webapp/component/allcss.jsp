<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          brand: '#006A4E',      // SUST Forest Green (Buttons, Text)
          brandhover: '#004d38', // Darker Green for hovers
          accent: '#FFC107',     // SUST Yellow (Icons, Highlights)
          dark: '#111827',       // SUST Black (Navbar, Footer)
        }
      }
    }
  }
</script>

<style>
    .glass-card {
        background: white;
        border-radius: 1rem;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        border-top: 5px solid #FFC107; /* Yellow top border for all cards */
    }
    .table-header {
        background-color: #f9fafb;
        text-transform: uppercase;
        font-size: 0.75rem;
        font-weight: 700;
        color: #111827;
        letter-spacing: 0.05em;
    }
</style>