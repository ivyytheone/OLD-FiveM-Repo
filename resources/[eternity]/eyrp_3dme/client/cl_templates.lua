Icons = {
    Main        = "bi-person-circle",
    Secondary   = "bi-chevron-compact-right" or ""
}
Templates = {
    Message = [[
        <div style="display: flex; justify-content: center; flex-flow: column; padding: 1rem; border-radius: 0.5em; background: rgba(44, 79, 102, 0.8);">
            <span style="filter: drop-shadow(0 0 0.10rem black); font-weight: 800; font-size: 15px display:flex; align-items: center;">
                <i class="bi-person-circle"></i> {0}
            </span>
            <div>
                <i style="filter: drop-shadow(0 0 0.10rem black);" class="bi bi-chevron-right"></i><small style="filter: drop-shadow(0 0 0.10rem black); margin: 3px; word-break: break-word;">{1}</small>
            </div>
        </div>
    ]]
}