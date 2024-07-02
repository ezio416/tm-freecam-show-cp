#if DEPENDENCY_GHOSTS_PP

Ghosts_PP::CheckpointIxTime@[]@ _GetCpDeetsFromGhosts() {
    auto app = GetApp();
    // auto mgr = Ghosts_PP::GetGhostClipsMgr(app);
    // if (mgr is null) return {};
    auto gs = Ghosts_PP::GetCurrentGhosts(app);
    CGameCtnGhost@ g = null;
    for (uint i = 0; i < gs.Length; i++) {
        if (g is null || g.RaceTime > gs[i].RaceTime) {
            @g = gs[i];
        }
    }
    if (g is null) return {};
    return Ghosts_PP::GetGhostCheckpoints(g);
}

uint[]@ GetCpSequenceFromGhosts() {
    auto deets = _GetCpDeetsFromGhosts();
    uint[] seq;
    for (uint i = 0; i < deets.Length; i++) {
        seq.InsertLast(deets[i].CheckpointIndex);
    }
#if SIG_DEVELOPER
    // trace("CP sequence from ghosts: " + Json::Write(seq.ToJson()));
#endif
    return seq;
}

bool HasGhosts() {
    auto mgr = Ghosts_PP::GetGhostClipsMgr(GetApp());
    if (mgr is null) return false;
    return mgr.Ghosts.Length > 0;
}

#else

uint[]@ GetCpSequenceFromGhosts() {
    return {};
}

bool HasGhosts() {
    return false;
}

#endif
