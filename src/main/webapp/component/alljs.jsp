<script>
    // Toggle Mobile Menu
    function toggleMenu() {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
    }

    // Toggle User Dropdown
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        dropdown.classList.toggle('hidden');
    }

    // Close dropdowns if clicking outside
    window.onclick = function(event) {
        if (!event.target.closest('.dropdown-btn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (!openDropdown.classList.contains('hidden')) {
                    openDropdown.classList.add('hidden');
                }
            }
        }
    }
</script>